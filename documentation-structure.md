# Documentation

Let's keep [the `organization` repo](https://github.com/LIonWeb-org/organization/) for ourselves.

Top-level = [GitHub organization](https://github.com/LIonWeb-org/) = [in this repo](https://github.com/LIonWeb-org/.github), starting at the `README`:

* ([issue #106](https://github.com/LIonWeb-org/organization/issues/106)) Aim of LIonWeb (most of the current `README`, as it is now)
* ([issue #107](https://github.com/LIonWeb-org/organization/issues/107)) Summary of core concepts and their relations (from the reference architecture) - just to build up an initial mental model
* ([issue #108](https://github.com/LIonWeb-org/organization/issues/108)) Use cases - currently [here](https://github.com/LIonWeb-org/organization/blob/meinte/use-case/documentation/use-cases.adoc)
* ([issue #109](https://github.com/LIonWeb-org/organization/issues/109)) Roadmap (of sorts, non-committal)
* ([issue #110](https://github.com/LIonWeb-org/organization/issues/110)) Contributing - how to contribute to this initiative (issues, PRs, etc.)
* How-to guides
	* ([issue #111](https://github.com/LIonWeb-org/organization/issues/111)) Implementations (- each implementation should have their own, short “Getting started” in their respective `README`):
		* [TypeScript](https://github.com/LIonWeb-org/lioncore-typescript) (JavaScript)
		* [Java](https://github.com/LIonWeb-org/lioncore-java)
		* [MPS](https://github.com/LIonWeb-org/lioncore-mps)
		* C#?
		* Kotlin?
	* ([issue #112](https://github.com/LIonWeb-org/organization/issues/112)) How to create a metamodel
		(Would be cool to have a Freon implementation of LIonCore at this point, running in the browser.)
	* ([issue #113](https://github.com/LIonWeb-org/organization/issues/113)) How to use the API (bulk mode)
	* ([issue #114](https://github.com/LIonWeb-org/organization/issues/114)) How to deserialize a **Model**
	* ([issue #115](https://github.com/LIonWeb-org/organization/issues/115)) How to serialize a **Model**
	* ([issue #116](https://github.com/LIonWeb-org/organization/issues/116)) How to implement model queries as a **Derived model** using a **Processor**
	* ([issue #117](https://github.com/LIonWeb-org/organization/issues/117)) How to evolve a metamodel
	* ([issue #118](https://github.com/LIonWeb-org/organization/issues/118)) How to implement a type system
* Explanation
	* ([issue #119](https://github.com/LIonWeb-org/organization/issues/119)) How do references work
	* ([issue #120](https://github.com/LIonWeb-org/organization/issues/120)) How does language reuse work (This should also showcase things like the diamond problem and such.)
		* Referencing
		* Embedding
		* _Extension_
		* (Reuse)
		* What does a “typical” multi-language architecture look like (Would be good to have a worked-out example for this)
* Reference
	* ([issue #121](https://github.com/LIonWeb-org/organization/issues/121)) Working principles
	* ([issue #122](https://github.com/LIonWeb-org/organization/issues/122)) Layering: data interchange “vs.” programmatic
	* ([issue #123](https://github.com/LIonWeb-org/organization/issues/123)) Reference architecture - currently in both the top-level README and in [this GDoc](https://docs.google.com/document/d/1_dsGs6RxcFEuTfnKmTDckllOLqzhsvwfKvmCZThBexs/edit#heading=h.j4l4qci8q98p)
	* ([issue #124](https://github.com/LIonWeb-org/organization/issues/124)) Serialization format (incl. links to schemas) - currently [here](https://github.com/LIonWeb-org/organization/blob/main/lioncore/serialization.adoc)
	* ([issue #125](https://github.com/LIonWeb-org/organization/issues/125)) LIonCore/M3:
		* Goal and scope - currently [here](https://github.com/LIonWeb-org/organization/blob/main/lioncore/m3-goal-and-scope.adoc)
		* Description including constraints - currently [here](https://github.com/LIonWeb-org/organization/blob/main/lioncore/metametamodel.adoc)
	* ([issue #126](https://github.com/LIonWeb-org/organization/issues/126)) Model correctness - currently [here](https://github.com/LIonWeb-org/organization/blob/meinte/correctness/documentation/correctness.adoc)
	* ([issue #127](https://github.com/LIonWeb-org/organization/issues/127)) API (bulk mode) - currently [here](https://github.com/LIonWeb-org/organization/blob/main/lioncore/repo-access-api.adoc)


Additional remarks on the “Getting started” part:

* It'd be good if documentation had a certain level of “liveness” e.g. through the use of [GitHub Blocks](https://blocks.githubnext.com/).
* Be able to switch between GPL (TypeScript, Java, C#?).

Plan:

* [&#10003;] Make an issue for every item above (and link to the issue in the list above)
* [&hellip;] Reorder according to _usefulness to a new reader_
* [&hellip;] Have a look at the [Diátaxis](https://diataxis.fr/) framework for additional inspiration and guidance
* Make the `organization` repo public, but readonly (including the Issues section) for outsiders
* Use the issues to organize the work
	* Use PRs when/where it makes sense
	* Edit PRs directly to give feedback

