unit u_Armadilhas;

interface
type
    TArmadilha = class
      private
            tipo: String;
            descricao: String;
            dano : integer;

     public
             procedure setTipo(tipo:String);
            function getTipo:String;
             procedure setDescricao(descricao:String);
            function getDescricao:String;
             procedure setDano(dano:integer);
            function getDano:integer;


    end;



implementation

{ TArmadilha }

function TArmadilha.getDano: integer;
begin
      result:= self.dano;
end;

function TArmadilha.getDescricao: String;
begin
      result:= self.descricao;
end;

function TArmadilha.getTipo: String;
begin
      result:= self.tipo;
end;

procedure TArmadilha.setDano(dano: integer);
begin
     self.dano:= dano;
end;

procedure TArmadilha.setDescricao(descricao: String);
begin
     self.descricao:= descricao;
end;

procedure TArmadilha.setTipo(tipo: String);
begin
     self.tipo:= tipo;
end;

end.
