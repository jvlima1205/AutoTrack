using Microsoft.EntityFrameworkCore;

namespace AutoTrack.Database.Models.Views;

[Keyless]
public class vwWorkOrder
{
    public int IdWorkOrder { get; set; }
    public string Number { get; set; }
    public string Description { get; set; }
    public DateTime PromisedDate { get; set; }
    public DateTime CreatAt { get; set; }

    public int IdVehicle { get; set; }
    public string Plate { get; set; }
    public int YearManufacture { get; set; }
    public int YearModel { get; set; }

    public int IdVehicleBrand { get; set; }
    public string Brand { get; set; }

    public int IdVehicleModel { get; set; }
    public string Model { get; set; }

    public int IdStatus { get; set; }
    public string Status { get; set; }

    public int IdClient { get; set; }
    public string Name { get; set; }
    public string Address { get; set; }
    public string HouseNumber { get; set; }
    public string District { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string? CEP { get; set; }
    public string Contact { get; set; }
}
