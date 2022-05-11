unit u_Tesouro;

interface

type

    TTesouro  = class
      private
           id : integer;
           conteudo: String;
      public
             procedure setId(id:integer);
            function getId:integer;
            procedure setConteudo(conteudo:String);
            function getConteudo:String;

    end;

implementation

{ TTesouro }

function TTesouro.getConteudo: String;
begin
     result:= self.conteudo;
end;

function TTesouro.getId: integer;
begin
     result:= self.id;
end;

procedure TTesouro.setConteudo(conteudo: String);
begin
      self.conteudo:= conteudo;
end;

procedure TTesouro.setId(id: integer);
begin
      self.id:= id;
end;

end.
