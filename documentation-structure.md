# Documentation

Let's keep [the `organization` repo](https://github.com/LIonWeb-org/organization/) for ourselves.

Top-level = [GitHub organization](https://github.com/LIonWeb-org/) = [in this repo](https://github.com/LIonWeb-org/.github), starting at the `README`:

* Aim of LIonWeb (as it is now)
* Summary of core concepts and their relations (from the reference architecture) - just to build up an initial mental model
* Use cases - currently [here](https://github.com/LIonWeb-org/organization/blob/meinte/use-case/documentation/use-cases.adoc)
* Getting started
	* Implementations (- each implementation should have their own short “Getting started” in their respective `README`s):
		* [TypeScript](https://github.com/LIonWeb-org/lioncore-typescript) (JavaScript)
		* [Java](https://github.com/LIonWeb-org/lioncore-java)
		* [MPS](https://github.com/LIonWeb-org/lioncore-mps)
		* C#?
		* Kotlin?
	* How to create a metamodel
		(Would be cool to have a Freon implementation of LIonCore at this point, running in the browser.)
	* How to use the API (bulk mode)
	* How to deserialize a **Model**
	* How to serialize a **Model**
	* How do references work
	* How to implement model queries as a **Derived model** using a **Processor**
	* How to evolve a metamodel
	* How to implement a type system
	* How does language reuse work (This should also showcase things like the diamond problem and such.)
		* Referencing
		* Embedding
		* _Extension_
		* (Reuse)
		* What does a “typical” multi-language architecture look like (Would be good to have a worked-out example for this)
* Reference
	* Working principles
	* Layering: data interchange “vs.” programmatic
	* Reference architecture - currently in both the top-level README and in [this GDoc](https://docs.google.com/document/d/1_dsGs6RxcFEuTfnKmTDckllOLqzhsvwfKvmCZThBexs/edit#heading=h.j4l4qci8q98p)
	* Serialization format (incl. links to schemas) - currently [here](https://github.com/LIonWeb-org/organization/blob/main/lioncore/serialization.adoc)
	* LIonCore/M3:
		* Goal and scope - currently [here](https://github.com/LIonWeb-org/organization/blob/main/lioncore/m3-goal-and-scope.adoc)
		* Description including constraints - currently [here](https://github.com/LIonWeb-org/organization/blob/main/lioncore/metametamodel.adoc)
	* Model correctness - currently [here](https://github.com/LIonWeb-org/organization/blob/meinte/correctness/documentation/correctness.adoc)
	* API (bulk mode) - currently [here](https://github.com/LIonWeb-org/organization/blob/main/lioncore/repo-access-api.adoc)
* Roadmap (of sorts, non-committal)


Additional remarks on the “Getting started” part:

* It'd be good if documentation had a certain level of “liveness” e.g. through the use of [GitHub Blocks](https://blocks.githubnext.com/).
* Be able to switch between GPL (TypeScript, Java, C#?).

