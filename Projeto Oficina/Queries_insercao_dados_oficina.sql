use oficina_mecanica;

show tables;
-- idCliente, nome, sobrenome, CPF, endereço
insert into cliente (nome, sobrenome, CPF, endereco) 
	   values('Maria','Costa de Almeida', 12346789, 'rua silva de prata 29, Carangola - Cidade das Rosas'),
		     ('Matheus','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das Rosas'),
			 ('Ricardo','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das Rosas'),
			 ('Julia','França', 789123456,'rua lareijras 861, Centro - Cidade das Rosas'),
			 ('Roberta','Assis', 98745631,'avenidade koller 19, Centro - Cidade das Rosas'),
			 ('Isabela','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das Rosas');

-- idCarro, placa, marca
insert into carro (placa, marca)
		values('6589ABC', 'toyota'),
			  ('6789AHC', 'honda'),
              ('6589ALC', 'toyota'),
              ('6589OPC', 'mercedes'),
              ('6789GRC', 'honda'),
              ('6989ATC', null);
					
select * from cliente;
select * from carro;

-- idMecanico, codigo, nome, endereço, especialidade
insert into mecanico (codigo, nome, endereco, especialidade)
			values('59832458','João','rodovia arthur bernarde, 458 - São Paulo','Tintura'),
				  ('57963214','maria','alamenda flores, 456 - São Paulo','polimento'),
				  ('85796324','Ana','augusto montenegro, 9510 - São Paulo','revisão'),
				  ('25369814','Marcela','y. ola, 14 - São Paulo','gerente'),
				  ('32145698','Antõnio','rua da providencia, 89 - São Paulo','manutenção'),
				  ('32178965','Fernanda','julio cesar, 45 - São Paulo','');
                  
select * from mecanico;

select * from pecas_e_servicos;
-- Tabela peças e serviços
insert into pecas_e_servicos(nome_peca, valor_peca, quantidade_peca, nome_servico, valor_servico, quantidade_servico)
		  values('roda',200.50,3,default,null,null),
				('roda',20050,2,default,null,null),
				('buzina',2.00,5,default,null,null),
				('parabrisas',2.00,5,default,null,null),
				(null,null,null,'Manutenção',500.00,1),
				('roda',200.50,2,'Nivelamento roda',10.00,4);

insert into avaliacao_equipe(idEquipe, idAvaliacao_equip_carro, idAvaliacao_equip_mecanico, n_equipe)
			values(1, 2, 1, 123456), (2, 1, 3, 123457), (3, 2, 2, 123458), (4, 2, 1, 123459), (5, 2, 2, 1234510), (6, 2, 1, 1234511);
		
insert into orcamento(idOrcamento_avaliacao_equipe, idOrcamento_pecas_produtos) 
				values 	(1,1), (3,2), (4,4), (2,3), (5,2);
                
insert into ordem_servico(idOrdem_servico, idOrdem_servico_aval_equip, numero, data_emissao, status_servico, data_conclusao)
			values (1, 1, 1012, '2022-10-4', 'Cancelado', '2022-10-8'), 
            (2, 2, 1013, '2022-09-28', default, '2022-09-28'), 
            (3, 3, 1014, '2022-12-18', 'Enviado', '2022-12-30'), 
            (4, 4, 1015, '2022-03-15', default, '2022-03-18'),
            (5, 5, 1016, '2022-04-19', 'Cancelado', '2022-04-20'),
            (6, 6, 1017, '2022-06-06', 'Cancelado', '2022-06-08');
            
 -- Finalizar essa parte!           
-- recuperação de pedido com produto associado
select * from cliente c 
				inner join ordem_servico o ON c.idCliente = o.idOrderClient
                inner join productOrder p on p.idPOorder = o.idOrder
		group by idClient; 
        
-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient;
