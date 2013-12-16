select r.data, count(distinct  r.id) as Total_de_Refeicoes, sum(a.calorias) as Total_de_Calorias 
from Refeicao r left join refeicao_alimentos ra on r.id = ra.refeicao_id 
left join alimento a on ra.alimento_id = a.id 
group by r.data


