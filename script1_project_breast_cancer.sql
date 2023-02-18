
/* Perform binarization of the class variable (0/1)
Realizar a binarização da variável classe (0/1)

1- Check total records / Checar o total de registros */


	select count(*) from cap03.tb_dados;

/* 286 records were detected. / Foram detectados 286 registros. */


/* 2- Find how many distinct values there are for the class column
Encontrar quantos valores distintos existem para a coluna classe */


	select distinct classe from cap03.tb_dados

/* The following records were found: 'no-recurrence-events, recurrence-events'
No-currence-events was assigned the value 0 and current-events was assigned the value 1.

Foram encontrados os seguintes registros: 'no-recurrence-events, recurrence-events'
Para no-currence-events foi atribuido o valor 0 e para currence-events foi atribuído o valor 1. */


	select
		case
			when classe = 'no-recurrence-events' then 0
			when classe = 'recurrence-events' then 1
		end as classe
	from cap03.tb_dados;


/* Perform the binarization of the radiating (0/1)
1- Check the distinct values.

Realizar a binarização da irradiando (0/1)
1- Checar os valores distintos. */


	select distinct irradiando from cap03.tb_dados;

/* The values 'no, yes' were obtained as a result, 'no'
was assigned the value '0' and 'yes' the value '1'.

Obteve-se os valores de 'no, yes' como resultado, para 'no'
foi atribuido o valor '0' e para 'yes' o valor '1'. */


	select
		case
			when irradiando = 'yes' then 1
			when irradiando = 'no' then 0
		end as irradiando
	from cap03.tb_dados;


/* Perform node_caps binarization (0/1)
1- Check the distinct values.

Realizar a binarização da node_caps (0/1)
1- Checar os valores distintos. */


	select distinct node_caps from cap03.tb_dados;


/* The values of: no, yes, ? were found. Where the ? is set to a null value
If defined for 'no', '0' would be assigned, for 'yes' the value '1' and for absent value the value of 2.

Foi encontrado os valores de: no, yes, ?. Onde o ? é definido com um valor nulo
Foi definido para 'no' seria atribuído '0', para 'yes' o valor '1' e para valor ausente o valor de 2. */


	select
		case
			when node_caps = 'yes' then 1
			when node_caps = 'no' then 0
			else 2
		end as node_caps
	from cap03.tb_dados;


/* Categorization of the breast variable (E/D)
1- select different values for the breast variable.

Categorização da variável seio (E/D)
1- selecionar os valores distintos para a variável seio. */


	select distinct seio from cap03.tb_navios;


/* Found values for 'right, left'. The value of right was assigned the value of 'D'
and the value of left was assigned the value of 'E'.

# Foram encontrados os valores de 'right, left'. Para o valor de right
#foi atribuído o valor de 'D' e para o valor de left foi atribuido o valor de 'E'. */


	select
		case
			when seio = 'left' then 'E'
			when seio = 'right' then 'D'
		end as seio
	from cap03.tb_dados;


/* Categorization of the tumor_size variable (6 categories)
1- select different values for the variable size_tumor.

Categorização da variável tamanho_tumor (6 categorias)
1- selecionar os valores distintos para a variável tamanho_tumor. */


select distinct tamanho_tumor from cap03.tb_dados;


/* The values found were (0-4, 5-9, 10-14, 15-19, 20-24, 25-29, 30-34, 35-39, 40-44, 45-49, 50-54) then
it was decided that the best strategy would be to re-categorize the variables.

Os valores encontrados foram (0-4, 5-9, 10-14, 15-19, 20-24, 25-29, 30-34, 35-39, 40-44, 45-49, 50-54)
então foi decidido que a melhor estratégia seria a de fazer uma recategorização das variáveis. */

	select
		case
			when tamanho_tumor = '0-4' or tamanho_tumor = '5-9' then 'Muito Pequeno'
			when tamanho_tumor = '10-14' or tamanho_tumor = '15-19' then 'Pequeno'
			when tamanho_tumor = '20-24' or tamanho_tumor = '25-29' then 'Medio'
			when tamanho_tumor = '30-34' or tamanho_tumor = '35-39' then 'Grande'
			when tamanho_tumor = '40-44' or tamanho_tumor = '45-49' then 'Muito Grande'
			when tamanho_tumor = '50-54' or tamanho_tumor = '55-59' then 'Tratamento Urgente'
		end as tamanho_tumor
	from cap03.tb_dados;


/* Carry out the label encoding of the quadrant variable (1,2,3,4,5)
1- Select different values for the quadrant variable.

Realizar o label encoding da variável quadrante (1,2,3,4,5)
1- Selecionar os valores distintos para a variável quadrante. */


	select distinct quadrante from cap03.tb_dados;


/* The following values were found (left_low, right_up, left_up, right_low, central, ?),
then the change was made to numerical values from 1 to 5 and the missing values were replaced by 0.

Foram encontrados os segunintes valores (left_low, right_up, left_up, right_low, central, ?),
então foi realizado o a troca para valores numéricos de 1 a 5 e os valores ausentes foram substituídos por 0. */

	select
		case
			when quadrante = 'left_low' then 1
			when quadrante = 'right_up' then 2
			when quadrante = 'left_up' then 3
			when quadrante = 'right_up' then 4
			when quadrante = 'central' then 5
			else 0
		end as quadrante
	from cap03.tb_dados;



select
	case
		when classe = 'no-recurrence-events' then 0
		when classe = 'recurrence-events' then 1
	end as classe,
	idade,
	menopausa,
	case
		when tamanho_tumor = '0-4' or tamanho_tumor = '5-9' then 'Muito Pequeno'
		when tamanho_tumor = '10-14' or tamanho_tumor = '15-19' then 'Pequeno'
		when tamanho_tumor = '20-24' or tamanho_tumor = '25-29' then 'Medio'
		when tamanho_tumor = '30-34' or tamanho_tumor = '35-39' then 'Grande'
		when tamanho_tumor = '40-44' or tamanho_tumor = '45-49' then 'Muito Grande'
		when tamanho_tumor = '50-54' or tamanho_tumor = '55-59' then 'Tratamento Urgente'
	end as tamanho_tumor,
	inv_nodes,
	case
		when node_caps = 'yes' then 1
		when node_caps = 'no' then 0
		else 2
	end as node_caps,
	deg_malig,
	case
		when seio = 'left' then 'E'
		when seio = 'right' then 'D'
	end as seio,
	case
		when quadrante = 'left_low' then 1
		when quadrante = 'right_up' then 2
		when quadrante = 'left_up' then 3
		when quadrante = 'right_up' then 4
		when quadrante = 'central' then 5
		else 0
	end as quadrante,
	case
		when irradiando = 'yes' then 1
		when irradiando = 'no' then 0
	end as irradiando
from cap03.tb_dados;


/* CREATING A NEW TABLE
CRIANDO UMA NOVA TABELA */


create table cap03.tb_dados2
as
select
	case
		when classe = 'no-recurrence-events' then 0
		when classe = 'recurrence-events' then 1
	end as classe,
	idade,
	menopausa,
	case
		when tamanho_tumor = '0-4' or tamanho_tumor = '5-9' then 'Muito Pequeno'
		when tamanho_tumor = '10-14' or tamanho_tumor = '15-19' then 'Pequeno'
		when tamanho_tumor = '20-24' or tamanho_tumor = '25-29' then 'Medio'
		when tamanho_tumor = '30-34' or tamanho_tumor = '35-39' then 'Grande'
		when tamanho_tumor = '40-44' or tamanho_tumor = '45-49' then 'Muito Grande'
		when tamanho_tumor = '50-54' or tamanho_tumor = '55-59' then 'Tratamento Urgente'
	end as tamanho_tumor,
	inv_nodes,
	case
		when node_caps = 'yes' then 1
		when node_caps = 'no' then 0
		else 2
	end as node_caps,
	deg_malig,
	case
		when seio = 'left' then 'E'
		when seio = 'right' then 'D'
	end as seio,
	case
		when quadrante = 'left_low' then 1
		when quadrante = 'right_up' then 2
		when quadrante = 'left_up' then 3
		when quadrante = 'right_up' then 4
		when quadrante = 'central' then 5
		else 0
	end as quadrante,
	case
		when irradiando = 'yes' then 1
		when irradiando = 'no' then 0
	end as irradiando
from cap03.tb_dados;