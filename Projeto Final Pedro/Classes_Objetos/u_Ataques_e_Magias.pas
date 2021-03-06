unit u_Ataques_e_Magias;

interface

type
    TAtaquesMAgias = class
      private
          nome: String;
          descricao:String;
          nescessario: String;
          id_ficha: integer;
      public
            procedure setNome(nome:String);
            function getNome:String;
            procedure setDescricao(descricao:String);
            function getDescricao:String;
            procedure setNescessario(nescessario:String);
            function getNescessario:String;
            procedure setId_ficha(id_ficha:integer);
            function getId_ficha:integer;
    end;

implementation

{ TAtaquesMAgias }

function TAtaquesMAgias.getDescricao: String;
begin
      result:= self.descricao;
end;

function TAtaquesMAgias.getId_ficha: integer;
begin
     result:= self.id_ficha;
end;

function TAtaquesMAgias.getNescessario: String;
begin
     result:= nescessario;
end;

function TAtaquesMAgias.getNome: String;
begin
     result:= self.nome;
end;

procedure TAtaquesMAgias.setDescricao(descricao: String);
begin
     self.descricao:= descricao;
end;

procedure TAtaquesMAgias.setId_ficha(id_ficha: integer);
begin
     self.id_ficha:= id_ficha;
end;

procedure TAtaquesMAgias.setNescessario(nescessario: String);
begin
     self.nescessario:= nescessario;
end;

procedure TAtaquesMAgias.setNome(nome: String);
begin
     self.nome:= nome;
end;

end.
