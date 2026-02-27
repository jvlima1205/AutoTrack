using System.ComponentModel.DataAnnotations;

namespace AutoTrack.Database.Models.Tables;

public class tVehicleModel
{
    [Key]
    public int IdVehicleModel { get; set; }
    public string Model { get; set; }

}
