use registro_transporte;

insert into passageiros(nome,responsavel,semestre) values
	('renan','evandro','s4'),
	('ana','daniel','s4'),
	('italo','relva','s4');

select * from passageiros;

insert into rotas(local_saida,local_chegada,pontos) values
	('posto 2000','ifce','escola estadual-escola proficional-rodoviaria'),
	('ifce','exu','posto de beira de estrada-restaurante de luiz gonzaga'),
	('ifce','bahia','hotel-posto-restaurante');
    
select * from rotas;

insert into motoristas(cnh,nome,telefone) values
	('97372732832','raimundo','(88)9939-4392'),
	('97345543429','tonho','(85)9939-4396'),
	('97595959593','pereira','(18)9939-4393');
    
select * from motoristas;

insert into veiculos(placa,marca,modelo,tipo,assentos) values
	('eeee-02','chevrole','D20','caminhonete',3),
	('rrtw-21','toyota','Hilux','caminhonete',5),
	('rere-54','chevrole','D10','caminhonete',3);
    
select * from veiculos;

insert into viagems(data_hora_saida,data_hora_chegada,rota_id) values
	('2025-12-15 22:22:22','2025-12-16 22:22:22',1),
	('2024-10-23 11:11:11','2024-10-24 11:11:11',2),
	('2023-10-10 12:43:23','2023-10-10 12:43:23',3);
    
select * from viagems;

insert into passageiro_viagem(id_viagem,id_passageiro,passageiro_hora_entrada,
passageiro_hora_saida) values 
	(1,1,'2025-12-15 22:22:22','2025-12-16 22:22:22'),
	(2,2,'2025-12-15 22:22:22','2025-12-16 22:22:22'),
	(2,3,'2025-12-15 22:22:22','2025-12-16 22:22:22');
    
select * from passageiro_viagem;

-- ver as coisa

select rota_id from viagems where (id_viagem = 2);

-- ver as coisa com junção
select 
    p.nome as passageiro,
    v.id_viagem,
    r.local_saida,
    r.local_chegada,
    pv.passageiro_hora_entrada,
    pv.passageiro_hora_saida
from passageiro_viagem pv
join passageiros p on pv.id_passageiro = p.id_passageiro
join viagems v on pv.id_viagem = v.id_viagem
join rotas r on v.rota_id = r.id_rota
where v.id_viagem = 2;

-- atualizar
update passageiros
set nome = 'Yuri'
where(id_passageiro = 1);

-- delete
delete from passageiros where(id_passageiro = 3);
