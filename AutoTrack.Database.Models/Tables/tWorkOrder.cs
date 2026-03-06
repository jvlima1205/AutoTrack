using System.ComponentModel.DataAnnotations;

namespace AutoTrack.Database.Models;

public class tWorkOrder
{
    [Key]
    public int IdWorkOrder { get; set; }
    public int IdVehicleClient { get; set; }
    public int IdStatus { get; set; }
    public string Number { get; set; }
    public string? Description { get; set; }
    public DateTime PromisedDate { get; set; }
    public DateTime? CreatAt { get; set; }
}