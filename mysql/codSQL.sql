create database Site;
use Site;

CREATE TABLE IF NOT EXISTS `Site`.`TBProdutos` (
  `IDProduto` INT(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  PRIMARY KEY (`IDProduto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `site`.`TBCadastro`(
  `CPF` INT(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(150) NOT NULL,
  `Senha` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `site`.`TBVenda` (
  `IDVenda` INT not null,
  `CodProduto` int,
  `CodCadastro` INT,
  PRIMARY KEY (`IDVenda`),
    FOREIGN KEY (`CodCadastro`)
    REFERENCES `site`.`TBCadastro` (`CPF`),
	FOREIGN KEY (`CodProduto`)
    REFERENCES `site`.`TBProdutos` (`IDProduto`)
   )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Create table site.TBPagamento(
	IDvenda int not null primary key,
    ValorTotal int not null,
    TipoPagamento varchar(10) not null,
    CodVenda int not null,
		foreign key (CodVenda) 
		references site.TBVenda (IDVenda)
) 

delimiter $$
CREATE PROCEDURE SOMATOTAL1()
begin
declare total double;
DECLARE i int;
declare max int;
set i = 1;
set max = (select count(IDCarrinho) from tbcarrinho);
while i <= max do
	set total = (SELECT (p.preco * cart.QuantProd) total
	from tbcarrinho cart
	inner join tbcarrinho_produtos cp
	on cart.IDCarrinho = cp.codcarrinho
	inner join tbprodutos p
	on p.IDProduto = cp.codproduto
	where cart.IDCarrinho = i);
	set sql_safe_updates = 0;
	update tbcarrinho set valortotal = total WHERE idrnn = i;
	set i = i + 1;
end while;
select sum(valortotal) somatotal from tbcarrinho;
end $$
delimiter ;
call SOMATOTAL1;
drop procedure SOMATOTAL1;
#---Fim do SOMATOTAL---;







