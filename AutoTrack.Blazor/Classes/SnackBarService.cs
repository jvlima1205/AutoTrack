using MudBlazor;

namespace AutoTrack.Blazor.Classes
{
    public class SnackBarService(ISnackbar snackbar)
    {
        public void Success() => Success("Success");
        public void SuccessAdd() => Success("Dados adicionados com sucesso!");
        public void SuccessEdit() => Success("Dados editados com sucesso!");
        public void SuccessDelete() => Success("Dados removidos com sucesso!");
        public void Success(string message)
        {
            snackbar.Add(message, Severity.Success);
        }

        public void Error() => Error("Error");

        public void Error(string message)
        {
            snackbar.Add(message, Severity.Error);
        }


    }
}
