# Behavioral Design Patterns

## Chain of Responsibility:
Passes a request along a chain of handlers, where each handler either handles the request or passes it to the next handler in the chain. This pattern decouples the sender of a request from its receivers.

## Command:
Encapsulates a request as an object, thereby allowing for parameterization of clients with queues, requests, and operations. It also provides support for undoable operations.

## Interpreter:
Defines a grammatical representation for a language and provides an interpreter to deal with this grammar. It is used for interpreting expressions or sentences in a given language.

## Iterator:
Provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation. It allows traversal of a collection.

## Mediator:
Defines an object that encapsulates how a set of objects interact, promoting loose coupling by keeping objects from referring to each other explicitly. It centralizes complex communication and control logic between objects.

## Memento:
Captures and externalizes an object's internal state so that the object can be restored to this state later. It is used to implement undo and rollback functionalities.

## Observer:
Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically. It is commonly used in event handling systems.

## State:
Allows an object to alter its behavior when its internal state changes, appearing as if the object changed its class. It is used to manage state-dependent behavior.

## Strategy: 
Defines a family of algorithms, encapsulates each one, and makes them interchangeable. It allows the algorithm to vary independently from the clients that use it.

## Template Method:
Defines the skeleton of an algorithm in a method, deferring some steps to subclasses. It allows subclasses to redefine certain steps of an algorithm without changing the algorithm's structure.

## Visitor:
Represents an operation to be performed on the elements of an object structure. It allows you to define a new operation without changing the classes of the elements on which it operates.
