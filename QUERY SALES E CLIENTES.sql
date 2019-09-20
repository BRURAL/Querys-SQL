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
alter table RELATORIO alter column motivoatendimento varchar(100);
alter table RELATORIO alter column mailing varchar(100);
alter table RELATORIO alter column campanha varchar(100);
alter table RELATORIO alter column datacadastro date;
alter table RELATORIO alter column horacadastro date;
alter table RELATORIO alter column observacao varchar(max);

--RETIRAR DUPLICATAS DA PLANILHA SALESCALL
create procedure sp_converterSales_RetirarDuplicidades
as begin
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
alter table RELATORIO alter column motivoatendimento varchar(100);
alter table RELATORIO alter column mailing varchar(100);
alter table RELATORIO alter column campanha varchar(100);
alter table RELATORIO alter column datacadastro date;
alter table RELATORIO alter column horacadastro date;
alter table RELATORIO alter column observacao varchar(max);


insert into relatorio
select * from relatorio_DES;

DELETE FROM RELATORIO WHERE CODIGO NOT IN (SELECT MAX(CODIGO) As IdMaximo FROM RELATORIO GROUP BY Nome);

DELETE FROM RELATORIO 
WHERE MAILING = 'TESTE';
end





------------APENAS EXECUTAR INDIVIDUALMENTE CADA UMA DAS 4 LINHAS ABAIXO PARA ATUALIZAR A TABELA SALESCALL

exec sp_converterSales_RetirarDuplicidades

ALTER TABLE RELATORIO ADD ID INT IDENTITY;

DELETE FROM RELATORIO WHERE ID NOT IN (SELECT MAX(ID) As IdMaximo FROM RELATORIO GROUP BY Nome);

ALTER TABLE RELATORIO DROP COLUMN ID;

--TESTANDO DUPLICIDADE--------------------------------------------------------

select COUNT(NOME), NOME from RELATORIO
	group by nome
	having count(nome)>1


--SELECT PARA MOSTRAR QUAL COMPRADOR TEM COMPRA E LIGAÇÃO NA SALESCALL----------
SELECT r.* FROM RELATORIO R
INNER JOIN atualizada R1 ON R1.razao_social = R.nome


--SELECT PARA MOSTRAR QUAL COMPRADOR CONTÉM NA SALES E NÃO NA CLIENTE
SELECT R.* FROM RELATORIO R
left outer JOIN ATUALIZADA R1 ON (R.NOME = R1.RAZAO_SOCIAL)
where R1.razao_social is null


--SELECT PARA MOSTRAR QUAL COMPRADOR CONTÉM CLIENTES E NÃO SALES
SELECT * FROM ATUALIZADA R1
WHERE razao_social NOT IN (SELECT nome FROM RELATORIO)
order by razao_social





SELECT * FROM RELATORIO
WHERE NOME = 'SANTOS CORDEIRO LUIZ'

NILCEU SOMAVILLA
