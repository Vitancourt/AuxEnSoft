program FerramentaAuxEnSoft;

uses
  Forms,
  Inicio in 'Inicio.pas' {FormInicio},
  InicioAjuda in 'InicioAjuda.pas' {FormInicioAjuda},
  CriarCadastro in 'CriarCadastro.pas' {FormCriarCadastro},
  CriarCadastroAjuda in 'CriarCadastroAjuda.pas' {FormCriarCadastroAjuda},
  Home in 'Home.pas' {FormHome},
  HomeAjuda in 'HomeAjuda.pas' {FormHomeAjuda},
  CriarProjeto in 'CriarProjeto.pas' {FormCriarProjeto},
  CriarProjetoAjuda in 'CriarProjetoAjuda.pas' {FormCriarProjetoAjuda},
  AcessarProjeto in 'AcessarProjeto.pas' {FormAcessarProjeto},
  ModeloCascata in 'ModeloCascata.pas' {FormModeloCascata},
  ModeloCascataCasoDeUsoADDAjuda in 'ModeloCascataCasoDeUsoADDAjuda.pas' {FormModeloCascataCasoDeUsoADDAjuda},
  ModeloCascataCasoDeUsoListaAjuda in 'ModeloCascataCasoDeUsoListaAjuda.pas' {FormModeloCascataCasoDeUsoListaAjuda},
  modelocascatacasodeusolistafinal in 'modelocascatacasodeusolistafinal.pas' {FormModeloCascataCasoDeUsoListaFinal},
  ModeloCascataTabelaCriar in 'ModeloCascataTabelaCriar.pas' {FormModeloCascataTabelaCriar},
  ModeloCascataTabelaEditar in 'ModeloCascataTabelaEditar.pas' {FormModeloCascataTabelaEditar},
  ModeloCascataTabelaCriarAjuda in 'ModeloCascataTabelaCriarAjuda.pas' {FormModeloCascataTabelaCriarAjuda},
  ModeloCascataTabelaListaFinal in 'ModeloCascataTabelaListaFinal.pas' {FormModeloCascataTabelaListaFinal},
  ModeloCascataTabelaEditarAjuda in 'ModeloCascataTabelaEditarAjuda.pas' {FormModeloCascataTabelaEditarAjuda},
  ModeloCascataListaFinalAjuda in 'ModeloCascataListaFinalAjuda.pas' {FormModeloCascataListaFinalAjuda},
  ModeloCascataTesteUnidadeCriar in 'ModeloCascataTesteUnidadeCriar.pas' {FormModeloCascataTesteUnidadeCriar},
  ModeloCascataTesteUnidadeCriarAjuda in 'ModeloCascataTesteUnidadeCriarAjuda.pas' {FormModeloCascataTesteUnidadeCriarAjuda},
  ModelCascataTesteUnidadeEditar in 'ModelCascataTesteUnidadeEditar.pas' {FormModeloCascataTesteUnidadeEditar},
  ModelCascataTesteUnidadeEditarAjuda in 'ModelCascataTesteUnidadeEditarAjuda.pas' {FormModeloCascataTesteUnidadeEditarAjuda},
  ModeloCascataTesteUnidadeListaFinal in 'ModeloCascataTesteUnidadeListaFinal.pas' {FormModeloCascataTesteUnidadeListaFinal},
  ModeloCascataTesteSistemaDefinir in 'ModeloCascataTesteSistemaDefinir.pas' {formModeloCascataTesteSistemaDefinir},
  ModeloCascataTesteUnidadeListaFinalAjuda in 'ModeloCascataTesteUnidadeListaFinalAjuda.pas' {FormModeloCascataTesteUnidadeListaFinalAjuda},
  ModeloCascataTesteSistemaEditar in 'ModeloCascataTesteSistemaEditar.pas' {formModeloCascataTesteSistemaEditar},
  ModeloCascataTesteSistemaEditarAjuda in 'ModeloCascataTesteSistemaEditarAjuda.pas' {formModeloCascataTesteSistemaEditarAjuda},
  ModeloCascataTesteSistemaDefinirAjuda in 'ModeloCascataTesteSistemaDefinirAjuda.pas' {formModeloCascataTesteSistemaDefinirAjuda},
  ModeloCascataTesteSistemaListaFinal in 'ModeloCascataTesteSistemaListaFinal.pas' {formModeloCascataTesteSistemaListaFinal},
  ModeloCascataTesteSistemaListaFinalAjuda in 'ModeloCascataTesteSistemaListaFinalAjuda.pas' {formModeloCascataTesteSistemaListaFinalAjuda},
  ModeloCascataManutencaoCriar in 'ModeloCascataManutencaoCriar.pas' {formModeloCascataManutencaoCriar},
  ModeloCascataManutencaoCriarAjjuda in 'ModeloCascataManutencaoCriarAjjuda.pas' {formModeloCascataManutencaoCriarAjuda},
  ModeloCascataManutencaoEditar in 'ModeloCascataManutencaoEditar.pas' {formModeloCascataManutencaoEditar},
  ModeloCascataManutencaoEditarAjuda in 'ModeloCascataManutencaoEditarAjuda.pas' {formModeloCascataManutencaoEditarAjuda},
  ModeloCascataManutencaoListaFinal in 'ModeloCascataManutencaoListaFinal.pas' {formModeloCascataManutencaoListaFinal},
  modelocascatacasodeusolistafinalAjuda in 'modelocascatacasodeusolistafinalAjuda.pas' {formModeloCascataCasoDeUsoListaFinalAjuda},
  modelocascatatabelalistafinalAjuda in 'modelocascatatabelalistafinalAjuda.pas' {FormModeloCascataTabelaListaFinalAjuda},
  modelocascataTesteUnidadeCriarAjudaa in 'modelocascataTesteUnidadeCriarAjudaa.pas' {FormModeloCascataTesteUnidadeCriarAjudaa},
  ModeloCascataManutencaoListaFinalAjuda in 'ModeloCascataManutencaoListaFinalAjuda.pas' {formModeloCascataManutencaoListaFinalAjuda};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormInicio, FormInicio);
  Application.CreateForm(TFormModeloCascataTesteUnidadeCriarAjudaa, FormModeloCascataTesteUnidadeCriarAjudaa);
  Application.CreateForm(TformModeloCascataManutencaoListaFinalAjuda, formModeloCascataManutencaoListaFinalAjuda);
  Application.Run;
end.
