********** Résolution d'un système linéaire Ax=b par la méthode du gradient conjugué **********


Caractéristiques des machines :
  - M1 : Asus Zenbook, Intel® Core™ i5-8265U CPU @ 1.60GHz × 8, 8Go de mémoire, OS Ubuntu 20.04.1 LTS, 64 bits. 
  - M2 : 
  
  
Compilateur :
  gcc/gfortran version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)


Nomenclature des répertoires :
  - "Fichiersdonnées" rassemble l'ensemble des fichiers de données
  - "Gradient" comprend deux algorithmes du gradient conjugué avec des tests d'arrêts différents
  - "m1" et "m2" qui contiennent l'ensemble des fichiers résultats des deux membres du binôme
  - "Matrices" qui contient l'ensemble des matrices A étudiées

 
Contenu des fichiers de données :
  - Dimension de la matrice
  - Matrice
  - Second membre
  - (delta) //on ne l'a pas encore fait
  - Tolérance (Epsilon)
  - Conditionnement de la matrice
  - x0


Contenu des fichiers de résultats :
  - Les variables sont explicitement définies dans ces derniers
  
  
Tests d'arrêt :
  -  t1 : < ||b||_inf * tolérance
  -  t2 : < tolérance


Nom des fichiers :
  - dif_n pour la matrice de dimension n associé aux problèmes de diffusion 1D
  - lap_n pour la matrice de dimension n Laplacienne problèmes de diffusion 2D
  - tri_alpha_n la matrice de dimension n tridiagonale de paramètre alpha
  - elecmodif pour la matrice (jsp comment elle s appelle)
  - H_n pour la matrice de Hilbert de dimension n
  
****** Cas où la dimension est spécifiée *******
  - H_4_-10_0_0.d = Matrice de Hilbert de dim 4, tolérance 10^-10, sans perturbation, conditionnement 0 (infini), .d pour données
  - H_4_-10_0_0_t1_m2.res = Même chose, t1 pour le test d'arrêt 1, m2 pour calculs effectiués sur la machine 2, .res pour résultats

****** Cas où la dimension n'est pas spécifiée *******
  - W_-10_0_0.d = Matrice de Wilson, tolérance 10^-10, sans perturbation, conditionnement 0 (infini), .d pour données
  - W_-10_0_0_t1_m1.res = Même chose, test d'arret 1, calculs faits sur la machine 1, .res pour fichier résultat

****** Dernier cas *******
  - tri_2_10_1_0.d = Matrice de dimension 10 tridiagonale de paramètre 2, tolérance 10^-10, AVEC perturbation, conditionnement 0 (infini), .d pour données
  - tri_2_10_1_0_t1_m1.res = Même chose, test d'arret 1, calculs faits sur la machine 1, .res pour fichier résultat
  
Commande sur le shell script grace au Makefile
  - "make res1" -> execute l'algorithme t1 en prenant en entrée le fichier dgradient. Les résultats sont stockés dans le fichier res1
  - "make res2" -> même chose mais les résultats sont stockés dans res2
  - "make res" -> "make res1" et "make res2"
  - "make H" -> génère une matrice de Hilbert dans le fichier H de dimension spécifiée dans le fichier dim
  - "make dif" -> génère une matrice dif dans le fichier dif de dimension spécifiée dans le fichier dim
  - "make lap" -> génère une matrice Laplacienne dans le fichier lap de dimension spécifiée dans le fichier dim
  - "make tri_alpha" -> génère une matrice tridiagonale de paramètre alpha dans le fichier tri_alpha de dimension spécifiée dans le fichier dim_et_alpha
