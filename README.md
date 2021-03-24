	Proiect realizat de Cebotari Zinaida, 2020
	
	Partea 1
	Functia matrix_to_csr, in aceasta functie se verifica fiecare linie din matrice dacă are elemente nenule. Când pe o linie se găsește primul element nenul, valoarea acestuia se adauga în vectorul values, coloana pe care se afla el în matrice se adauga în vectorul colind, aceste informatii se stocheaza în ordinea în care se găsesc valorile. Apoi se verifica dacă pe actuala linie  mai sunt alte elemente nenule, se repeta aceiași procedura și după ce au fost găsite toate elementele diferite de 0 de pe o linie, în vectorul rowptr este salvată poziția ultimul element de pe acesta linie în colind și values.

	Funcția Jacobi_sparse,  stim ca functia csr_multiplication calculează A * y = x, rămâne doar s-a ii adaugam lui x, c (vectorul de iteratie Jacobi), pentru a obtine soluția sitemului, aceasta procedura se repeta pana nu s-a ajuns la acuratetea dorita (tol).

	Functia Jacobi_factorization, in aceasta functie pentru ca sa calculam matricea de interatie Jacobi și vectorul de iteratie Jacobi, ne folosim de formulele, G_J = inv(D) *(D – A) , unde D este diagonala matricei A, iar D – A reprezinta -L – U , unde L este matricea inferior triunghiulara a matricei A, iar U este superior triunghiulara. C_J se caluculeaza astfel C_J  = inv(D) * b, unde D este diagonala matricei A, iar b reprezintă un sitem liniar de ecuații.

	Functia generate_probabilities_system. Aceasta funcție genereaza matricea A. Fiecare poziție din labirint reprezintă o linie din matrice. Astfel in primul rand se calculează în funcție de cât de mare e labirintul, câte linii trebuie s-a aibă matricea A. Prima poziție din labirint, e repezentata de prima linie din matricea A, astfel, aceasta linie rămâne neschimbata, cât de mare nu ar fi labirintul, doar in cazul in care labirintul are mai putin de 3 pozitii, aceasta s-ar schimba, dar un labirint cu 2 pozitii, nu mai are rolul de labirint. Pe diagonala e plasat numărul de poziții în care se poate merge din prima, iar pe coloanele, al caror numar reprezintă pozițiile în care se poate ajunge, se pune -1. Astfel se procedeaza pentru toate pozițiile din labirint. 

	Pentru pozițiile din extrema stânga se fac calculele într-o bucla, care are atașat un count ce crește la fiecare iteratie, astfel se poate stabili care e următorea poziție de pe extrema stânga și cum trebuiesc calculate poziitile în care se poate ajunge din acea poziție. La fel se procedeaza și pentru elementele de pe extrema dreapta și pentru cele din mijloc, pentru fiecare este o bucla aparte.
	
	Pentru elementele din mijloc, mai avem nevoie de o bucla aditionala, o data ce a găsit o pozitie pe mijloc, face calculele necesare și pentru vecinii să-i de pe aceiași linie.

	La final se calculează pozițiile în care se poate ajunge de pe pozițiile de pe ultima linie a labirintului.

# clustering
	Partea 2 - Clustering 
	Functia clustering_pc. Se face etapa de inițializare, punctele din matricea points sunt distribuite în NC clustere. Clustere sunt repezentate de o matrice, punctele se distribuie astfel: linia pe care e trebuie plasat un punct, reprezintă clusterul din care face parte, iar pe coloanele acestei linii, se salvează pozițiile punctelor în matricea points. Pentru aceste clustere se calculează NC centroizii, care reprezintă media aritmetica a punctelor care se găsesc în clustere. Cenroizii sunt reprezentați de o matrice, prima linie din matrice e centroidul pentru primul cluster, și așa mai departe.

	Se initializeaza NC clustere goale și NC centroizi. Punctele se distribuie în clustere, în funcție de cât de mica este distanța intre punct și centroid, care se calculează făcând norma 2. După ce punctele sau redistribuit se calculează din nou centroizii. Acesta procedura se repeta, pana centroizii nu se stabilizeaza, adică centroizii de la iteratia anterioara sunt la fel cu cei de la iteratia curenta, acesta se verifica făcând norma 2, intre centroizi.

Functia compute_cost_pc. În aceasta funcție se distribuie punctele în clustere, conform centroizilor primiti. Apoi se face suma dintre distanța de la fiecare punct la cluster.

	Partea 3
	Functia rgbHistogram , în aceasta functie citesc cu imread matricea de pixeli asociata imaginii într-o matrice picture, separ imaginea în straturi de culori:  roșu, verde, albastru. Determin vectorul sol, cu functia implicita histc, pentru fiecare strat în parte.

	Functia hsvHistogram, în aceasta funcție cu imread citesc matricea de pizxeli, fac cast la valorile din matrice la valori reale, o împart la 255 și dispart imaginea în straturi de culori. Apoi conform algoritmului din enunt, formez matricile H, S, V și ca la functia anterioara determin sol, folosind functia implicita histc.
