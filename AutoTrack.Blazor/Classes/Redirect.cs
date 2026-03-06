using Microsoft.AspNetCore.Components;

namespace AutoTrack.Blazor.Classes;

public class Redirect(NavigationManager Nav)
{
    public void Error(Exception ex)
    {
        Nav.NavigateTo($"/Error?errormessage={ex.Message}&innererror={ex.InnerException}&details={ex}");
    }
}
