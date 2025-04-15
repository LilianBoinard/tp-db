USE diginamic;

# a
DELETE compo
FROM diginamic.compo
         JOIN diginamic.bon ON compo.ID_BON = bon.ID
WHERE YEAR(bon.DATE_CMDE) = '2019'
  AND MONTH(bon.DATE_CMDE) = 4;

# b
DELETE
FROM diginamic.bon
WHERE YEAR(bon.DATE_CMDE) = '2019'
  AND MONTH(bon.DATE_CMDE) = 4;
