using Microsoft.EntityFrameworkCore;

namespace AutoTrack.Database.Models.Views;

[Keyless]
public class vwVehicleClient
{
    public int IdClient { get; set; }

    public string Name { get; set; } = string.Empty;

    public string Address { get; set; } = string.Empty;

    public string HouseNumber { get; set; } = string.Empty;

    public string District { get; set; } = string.Empty;

    public string City { get; set; } = string.Empty;

    public string State { get; set; } = string.Empty;

    public string? CEP { get; set; }

    public string Contact { get; set; } = string.Empty;

    public string? ContactAux { get; set; }

    public int IdVehicleClient { get; set; }

    public int IdVehicle { get; set; }

    public int IdVehicleBrand { get; set; }

    public string Brand { get; set; } = string.Empty;

    public string Vehicle { get; set; } = string.Empty;

    public string Plate { get; set; } = string.Empty;

    public int YearManufacture { get; set; }

    public int YearModel { get; set; }

}
