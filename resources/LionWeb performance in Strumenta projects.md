# LionWeb performance in Strumenta projects

* 2MLoC of code IBM EGL for a financial company; to be translated to Java
* because of diff. EGL and Java: translated Java code is 5x larger than EGL
* 10Mnodes get converted into 15Mnodes
* parse the EGL code base, and store the result; then resolve all references, and store the result; transpiler loads that result in memory, transpiles that to a Java AST, and then unparses it — tracing is done to be able to correspond Java and EGL code, by adding bidirectional annotations source <-> target, and also store line information on the unparsed Java code on those annotations
* using LW server:
	* server was slow, because of writes to the DB
	* => switched to saving temporary results (ASTs), with each partition as a separate file in the Protobuf variant of the LW serialization format, (and then zipped)
	* (1 partition = 1 file, throughout)
	* processing means loading all partitions in memory
	* memory was problematic, but more because of temporary allocation due to processing than pure model size (some nodes are in memory twice) <== took a lot of work to reduce memory usage purely coming from Java and the pure Java frameworks being used
	* complete migration (end-to-end) now takes 14 minutes; CI is given 47GB of memory
* results of static analysis (e.g. functions being used twice, or in-only vs. in+out arguments) is also stored as annotations, and the whole AST is then persisted with those annotations <== avoids recomputation
* implemented own Protobuf unmarshaller (directly from binary -> LionWeb nodes) to avoid memory overusage by the official Protobuf framework
* LionWeb-centric optimizations:
	* using Protobuf to store LionWeb ASTs is the LionWeb-centric optimization
	* added caches to compute things like all features, etc.
	* during deserialization, pre-allocating arrays/lists (to the correct length) helps with (time+memory) performance
	* parse files in parallel
	* have an own in-memory server that also support parallel access
* Alessio is also talking about this: how much overlap?
* use of delta protocol: not at all; infrastructure that’d be needed for implementing delta protocol in `lionweb-jvm` is useful for cache invalidation
* gave up on keeping IDs stable (outside of stdlib-like things): took too much memory
* in Java: converting usage of Stream API to `for`-loops saves memory, and performs better

