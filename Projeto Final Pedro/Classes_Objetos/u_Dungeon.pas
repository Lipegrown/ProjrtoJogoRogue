unit u_Dungeon;

interface

type
    TDungeon = class
      private
           nome: String;

      public
            procedure setNome(nome:String);
            function getNome:String;
    end;

implementation

{ TDungeon }

function TDungeon.getNome: String;
begin
      result:= self.nome;
end;

procedure TDungeon.setNome(nome: String);
begin
     self.nome:= nome;
end;

end.
