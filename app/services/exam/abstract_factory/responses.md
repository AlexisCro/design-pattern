## 4.1
On voit que dans le program fournit le principe de responsabilité unique n'est pas respecté.
En effet le programme gère toutes les éventualités de notifications (email, SMS, push notification) dans une seule et même classe.

L'évolutivité du code est donc limitée car à chaque fois qu'un nouveau type de notification doit être ajouté, 
il faut modifier la classe `NotificationService`.
On ne respecte donc pas le principe Open/Closed.

Aucune substitution n'est possible 

## 4.2
Le pattern qui pourrait le plus répondre à ces problématiques serait l'Abstract Factory.
