using System.ComponentModel.DataAnnotations;

namespace AutoTrack.Database.Models.Tables;

public class tVehicleClient
{
    [Key]
    public int IdVehicleClient { get; set; }
    public int IdVehicle { get; set; }
    public int IdClient { get; set; }
    public string Plate { get; set; } = string.Empty;
    public int YearManufacture { get; set; }
    public int YearModel { get; set; }

}
