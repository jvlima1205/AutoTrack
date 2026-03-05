using Microsoft.EntityFrameworkCore;

namespace AutoTrack.Database.Models.Views;

[Keyless]
public class vwVehicle
{
    public int IdVehicle { get; set; }
    public int IdVehicleBrand { get; set; }
    public string Brand { get; set; }
    public string Vehicle { get; set; }
}
