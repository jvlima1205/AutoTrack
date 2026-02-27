using System.ComponentModel.DataAnnotations;

namespace AutoTrack.Database.Models;

public class tVehicle
{
    [Key]
    public int IdVehicle { get; set; }
    public int IdClient { get; set; }
    public int IdVehicleBrand { get; set; }
    public int IdVehicleModel { get; set; }
    public string Plate { get; set; }
    public int YearManufacture { get; set; }
    public int YearModel { get; set; }
}
