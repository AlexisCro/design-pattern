## 2.1
Il s'agit d'un pattern Factory Method

## 2.2
Une factory method se compose :
- d'une classe abstraite avec une méthode abstraite afin de créer des objets concrets
- de classes concrètes qui implémentent la méthode de création d'objets en la surchargea

Dans le code fournit, on retrouve la classe abstraite `VehicleFactory` avec la méthdode abstraite `CreateVehicle()` et on retrouve également 
les classes concrètes `CarFactory`, `MotorcycleFactory` et `TruckFactory`qui surcharge la méthode `CreateVehicle()` pour créer des objets spécifiques.

## 2.3
La method `OrderVehicle` permet la création de l'objet puis de l'assembler.

Ce type de méthode réalisant des actions provenant des classes implémentant la classe abstraite est appelé "Template Method".

## 2.4
La différence entre le pattern Factory Method se concentre sur la création d'un seul type d'objet, 
tandis que l'Abstract Factory gère la création de plusieurs types d'objets liés.

On préfère faire usage de l'Abstract Factory lorsque l'on souhaite créer des familles d'objets liés sans spécifier leurs classes concrètes.
Tandis que le Factory Method est plus adapté lorsque l'on souhaite déléguer la création d'un objet à des sous-classes spécifiques.
