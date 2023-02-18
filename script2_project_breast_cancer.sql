
# 1- Apply label encoding to the menopause variable
# 1- Aplique label encoding a variável menopausa

create table cap03.tb_dados3
as
select 
classe,
idade,
case
	when menopausa = 'premeno' then 1
	when menopausa = 'ge40' then 2
	when menopausa = 'lt40' then 3
end as menopausa,
tamanho_tumor,
inv_nodes,
node_caps,
deg_malig,
seio,
quadrante,
irradiando
from cap03.tb_dados2;



# 2- Create a new column called position_tumor by concatenating the columns inv_nodes and quadrant.
# 2- Crie uma nova coluna chamda posicao_tumor concatenando as colunas inv_nodes e quadrante.

create table cap03.tb_dados4
as
select
classe,
idade,
menopausa,
tamanho_tumor,
concat(inv_nodes, '-', quadrante) as posicao_tumor,
node_caps,
deg_malig,
seio,
quadrante,
irradiando
from cap03.tb_dados3;



# 3- Apply One-Hot-Encoding to column deg_malig.
# 3- Aplique One-Hot-Encoding a coluna deg_malig.

create table cap03.tb_dados5
as
select
classe,
idade,
menopausa,
tamanho_tumor,
posicao_tumor,
node_caps,
	case when deg_malig = 1 then 1 else 0 end as deg_malig_cat1,
	case when deg_malig = 2 then 1 else 0 end as deg_malig_cat2,
	case when deg_malig = 3 then 1 else 0 end as deg_malig_cat3,
seio,
irradiando
from cap03.tb_dados4;



# 4- Create a new dataset with all the variables after the previous transformations.
# 4- Criar um novo dataset com todas as variáveis após as transformações anteriores.
