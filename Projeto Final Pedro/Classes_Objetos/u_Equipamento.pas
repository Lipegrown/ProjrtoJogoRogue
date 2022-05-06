unit u_Equipamento;

interface

type
    TEquipamento = class
      private
            nome: String;
            descricao: String;
            quantidade: integer;
            peso: double;
            id_ficha: integer;
      public
            procedure setNome(nome:String);
            function getNome:String;
            procedure setDescricao(descricao:String);
            function getDescricao:String;
            procedure setQuantidade(quantidade:integer);
            function getQuantidade:integer;
            procedure setId_ficha(id_ficha:integer);
            function getId_ficha:integer;
            procedure setPeso(peso:double);
            function getPeso:double;

    end;

implementation

{ TEquipamento }

function TEquipamento.getDescricao: String;
begin
      result:= self.descricao;
end;

function TEquipamento.getId_ficha: integer;
begin
     result:= self.id_ficha;
end;

function TEquipamento.getNome: String;
begin
     result:= self.nome;
end;

function TEquipamento.getPeso: double;
begin
      result:= self.peso;
end;

function TEquipamento.getQuantidade: integer;
begin
     result:= self.quantidade;
end;

procedure TEquipamento.setDescricao(descricao: String);
begin
      self.descricao:= descricao;
end;

procedure TEquipamento.setId_ficha(id_ficha: integer);
begin
     self.id_ficha:= id_ficha;
end;

procedure TEquipamento.setNome(nome: String);
begin
      self.nome:= nome;
end;

procedure TEquipamento.setPeso(peso: double);
begin
     self.peso:= peso;
end;

procedure TEquipamento.setQuantidade(quantidade: integer);
begin
     self.quantidade:= quantidade;
end;

end.
