program Projeto_rougue;

uses
  Vcl.Forms,
  u_ProjetoDeD in '..\u_ProjetoDeD.pas' {Form2},
  u_Raca in 'u_Raca.pas',
  u_Classe in 'u_Classe.pas',
  u_atributos in 'u_atributos.pas',
  u_Ataques_e_Magias in 'u_Ataques_e_Magias.pas',
  u_Equipamento in 'u_Equipamento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
