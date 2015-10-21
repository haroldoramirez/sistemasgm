unit USingleton;

interface
    uses UDM;

    var
      DM: TDM;

    function getInstance: TDM;

implementation

function getInstance: TDM;
begin
  if not Assigned(DM) then
  begin
      DM := TDM.Create(nil);
      DM.DataModuleCreate; //Adiciona a configuração do Banco de Dados
  end;
  result := DM;
end;

end.
