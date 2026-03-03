using System.ComponentModel.DataAnnotations;

namespace AutoTrack.Database.Models.Tables;


public class tVehicleBrand
{
    [Key]
    public int IdVehicleBrand { get; set; }
    public string Brand { get; set; }
}
