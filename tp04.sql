USE diginamic;

# a

SELECT *
FROM article
ORDER BY article.DESIGNATION;

# b
SELECT *
FROM article
ORDER BY article.PRIX DESC;

# c
SELECT *
FROM article
WHERE article.DESIGNATION
          LIKE 'Boulon%'
ORDER BY article.PRIX;

# d
SELECT *
FROM article
WHERE article.DESIGNATION
          LIKE '%sachet%';

# e
SELECT *
FROM article
WHERE article.DESIGNATION COLLATE utf8mb4_bin
          LIKE '%sachet%';

# f
SELECT fournisseur.NOM, article.REF, article.PRIX
FROM article
         JOIN fournisseur ON article.ID_FOU = fournisseur.ID
ORDER BY fournisseur.NOM,
         article.PRIX DESC;

# g
SELECT fournisseur.ID, fournisseur.NOM, article.REF
FROM article
         JOIN fournisseur ON article.ID_FOU = fournisseur.ID
WHERE fournisseur.ID = 3;

# h
SELECT fournisseur.ID, fournisseur.NOM, AVG(article.PRIX) as moyenne
FROM article
         JOIN fournisseur ON article.ID_FOU = fournisseur.ID
WHERE fournisseur.ID = 3;

# i
SELECT fournisseur.ID, fournisseur.NOM, AVG(article.PRIX) as moyenne
FROM article
         JOIN fournisseur ON article.ID_FOU = fournisseur.ID
GROUP BY fournisseur.ID, fournisseur.NOM;

# j
SELECT *
FROM bon
WHERE bon.DATE_CMDE BETWEEN '2019-03-01' AND '2019-04-05 12:00:00';

# k
SELECT DISTINCT bon.ID, article.DESIGNATION
FROM compo
         JOIN bon ON compo.ID_BON = bon.ID
         JOIN article ON compo.ID_ART = article.ID
WHERE article.DESIGNATION LIKE '%boulon%';

# l
SELECT DISTINCT bon.ID, bon.NUMERO, fournisseur.nom
FROM compo
         JOIN bon ON compo.ID_BON = bon.ID
         JOIN article ON compo.ID_ART = article.ID
         JOIN fournisseur ON bon.ID_FOU = fournisseur.ID
WHERE article.DESIGNATION LIKE '%boulon%';

# m
SELECT bon.ID,
       bon.NUMERO,
       SUM(compo.QTE * article.PRIX)
FROM compo
         JOIN bon ON compo.ID_BON = bon.ID
         JOIN article ON compo.ID_ART = article.ID
GROUP BY bon.ID, bon.NUMERO;

# n
SELECT bon.ID,
       bon.NUMERO,
       COUNT(compo.ID_ART)
FROM compo
         JOIN bon ON compo.ID_BON = bon.ID
GROUP BY bon.ID, bon.NUMERO;

# o
SELECT bon.NUMERO,
       COUNT(compo.ID_ART)
FROM compo
         JOIN bon ON compo.ID_BON = bon.ID
GROUP BY bon.ID, bon.NUMERO
HAVING COUNT(compo.ID_ART) > 25;

# p
SELECT SUM(compo.QTE * article.PRIX)
FROM compo
         JOIN bon ON compo.ID_BON = bon.ID
         JOIN article ON compo.ID_ART = article.ID
WHERE MONTH(bon.DATE_CMDE) = 4;





