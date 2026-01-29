## 1.1 
Nous avons besoin d'implémenter le design pattern Singleton afin de garantir une seule instance de l'objet session correspondant à la connexion de l'utilisateur.

## 1.2
![img.png](img.png)

1.3
[Implémentation singleton](./session.rb)

1.4
Avantages :
- Contrôle d'accès à une seule instance.
- Réduction de l'utilisation des ressources.

Inconvénients :
- Difficulté à tester en raison de l'état global.
- Peut compliquer la gestion du cycle de vie de l'objet.
