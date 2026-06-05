create database registro_transporte;
use registro_transporte;

-- tabela passageiros
create table passageiros(
	id_passageiro 			int auto_increment primary key,
    nome 					varchar(90) not null,
	responsavel 			varchar(90) not null,
	semestre 				varchar(2) not null
    -- chave esrangeira semestre
);	
-- tabela semestre 
create table rotas(
	id_rota 				int auto_increment primary key,
    local_saida 			varchar(65) not null,
    local_chegada 			varchar(65) not null,
    pontos 					varchar(200) not null
);

create table motoristas(
	id_motorista 			int auto_increment primary key,
    cnh 					varchar(20) not null,
    nome 					varchar(45) not null,
    telefone 				varchar(20)
);

create table veiculos(
	id_veiculo 				int auto_increment primary key,
    placa 					varchar(15) not null,
    modelo 					varchar(45)
);

create table viagems(
	id_viagem 				int auto_increment primary key,
    data_hora_saida 		datetime not null,
    data_hora_chegada 		datetime not null,
    rota_id 				int,
    
    foreign key(rota_id) references rotas(id_rota)
);

create table passageiro_viagem(
	id_viagem 				int,
    id_passageiro 			int,
    passageiro_hora_entrada datetime not null,
    passageiro_hora_saida 	datetime not null,
    
    foreign key(id_viagem) references viagems(id_viagem),
    foreign key(id_passageiro) references passageiros(id_passageiro)
);

create table operacao(
	id_operacao 			int auto_increment primary key,
	id_viagem 				int,
    id_veiculo 				int,
    id_motorista 			int,
    
    foreign key(id_viagem) 	references viagems(id_viagem),
    foreign key(id_veiculo) references veiculos(id_veiculo),
    foreign key(id_motorista) references motoristas(id_motorista)
);

