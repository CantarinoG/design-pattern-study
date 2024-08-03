# Creational Design Patterns

## Singleton:
Ensures that a class has only one instance and provides a global point of access to that instance. It's commonly used for managing shared resources like configuration settings or database connections.

## Factory Method: 
Defines an interface for creating objects, but allows subclasses to alter the type of objects that will be created. It helps in promoting loose coupling by eliminating the need to bind application-specific classes into the code.

## Abstract Factory:
Provides an interface for creating families of related or dependent objects without specifying their concrete classes. It helps in encapsulating a group of individual factories that share a common theme.

## Builder:
Separates the construction of a complex object from its representation, allowing the same construction process to create different representations. It is used to construct a complex object step by step.

## Prototype:
Creates new objects by copying an existing object, known as a prototype. It is used when the type of objects to create is determined by a prototypical instance, which is cloned to produce new objects.