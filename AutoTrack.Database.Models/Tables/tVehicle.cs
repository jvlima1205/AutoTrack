using System.ComponentModel.DataAnnotations;

namespace AutoTrack.Database.Models;

public class tVehicle
{
    [Key]
    public int IdVehicle { get; set; }
    public int IdVehicleBrand { get; set; }
    public string Vehicle { get; set; }
}
