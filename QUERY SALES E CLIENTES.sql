use Refinamento_Clientes

--IMPORTAR PLANILHA CLIENTES 15_19 E EXECUTAR OS CÓDIGOS ABAIXO
alter table atualizada alter column tipo varchar(100);
alter table atualizada alter column cod_cliente int not null;
alter table atualizada alter column cgc varchar(100);
alter table atualizada alter column iestadual varchar(100);
alter table atualizada alter column razao_social varchar(100);
alter table atualizada alter column endereco_1 varchar(100);
alter table atualizada alter column bairro_1 varchar(100);
alter table atualizada alter column cidade_1 varchar(100);
alter table atualizada alter column cep_1 varchar(100);
alter table atualizada alter column estado_1 varchar(100);
alter table atualizada alter column ddd1 varchar(100);
alter table atualizada alter column telefone1 varchar(50);
alter table atualizada alter column ddd2 varchar(100);
alter table atualizada alter column telefone2 varchar(100);
alter table atualizada alter column ddd3 varchar(100);
alter table atualizada alter column telefone3 varchar(100);
alter table atualizada alter column num_nf varchar(100);
alter table atualizada alter column cod_barra varchar(100);
alter table atualizada alter column descricao varchar(100);
alter table atualizada alter column quantidade varchar(50);
alter table atualizada alter column ultimovendedor varchar(100);
alter table atualizada alter column statusvendedor varchar(100);
alter table atualizada alter column perfilcli varchar(100);
alter table atualizada alter column itens varchar(100);
alter table atualizada alter column media varchar(100);
alter table atualizada alter column dtnascimento datetime;

select * from atualizada
end


--IMPORTAR PLANILHA SALLES CALL ATUALIZADA, A QUAL DEVE SER ATUALIZADA NO BANCO SALESCALL
--E DEPOIS EXECUTAR OS CÓDIGOS ABAIXO
alter table RELATORIO alter column codigo int not null;
alter table RELATORIO alter column operador varchar(100);
alter table RELATORIO alter column nome varchar(100);
alter table RELATORIO alter column cpfcnpj varchar(50);
alter table RELATORIO alter column telefone1 varchar(50);
alter table RELATORIO alter column telefone2 varchar(50);
alter table RELATORIO alter column telefone3 varchar(50);
alter table RELATORIO alter column telefone4 varchar(50);
alter table RELATORIO alter column telefone5 varchar(50);
alter table RELATORIO alter column cidade varchar(50);
alter table RELATORIO alter column uf varchar(50);
alter table RELATORIO alter column representantelegal varchar(50);
alter table RELATORIO alter column tipoatendimento varchar(100);
alter table RELATORIO alter column motivoagendamento varchar(100);
alter table RELATORIO alter column mailing varchar(100);
alter table RELATORIO alter column campanha varchar(100);
alter table RELATORIO alter column datacadastro date;
alter table RELATORIO alter column horacadastro date;
alter table RELATORIO alter column observacao varchar(max);

--RETIRAR DUPLICATAS DA PLANILHA SALESCALL

insert into relatorio
select * from relatorio2

delete from relatorio
where codigo in
	(select max(codigo)from RELATORIO
	group by nome
	having count(nome)>1)

DELETE FROM RELATORIO 
WHERE MAILING = 'TESTE'

select p.* from atualizada p
where 

--SELECT PARA MOSTRAR QUAL COMPRADOR TEM COMPRA E LIGAÇÃO NA SALESCALL

SELECT r.* FROM RELATORIO R
INNER JOIN atualizada R1 ON R1.razao_social != R.nome