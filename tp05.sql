USE diginamic;

# a
UPDATE diginamic.article
SET article.DESIGNATION = LOWER(article.DESIGNATION)
WHERE article.ID = 2;

# b
UPDATE diginamic.article
SET article.DESIGNATION = UPPER(article.DESIGNATION)
WHERE article.PRIX > 10;

# c
UPDATE diginamic.article
SET article.PRIX = article.PRIX - (article.PRIX * 10/100)
WHERE ID NOT IN (
    SELECT ID_ART FROM diginamic.compo
);

# d
UPDATE diginamic.compo
    JOIN diginamic.bon ON compo.ID_BON = bon.ID
    JOIN diginamic.fournisseur ON bon.ID_FOU = fournisseur.ID
SET compo.QTE = compo.QTE * 2
WHERE fournisseur.NOM = 'Française d\'imports';

# e
UPDATE diginamic.article
SET article.DESIGNATION = REPLACE(article.DESIGNATION, SUBSTRING(article.DESIGNATION, POSITION('(' IN article.DESIGNATION), POSITION(')' IN article.DESIGNATION)), '')

