using System.ComponentModel.DataAnnotations;

namespace AutoTrack.Database.Models.Tables;

public class tStatus
{
    [Key]
    public int IdStatus { get; set; }
    public string Status { get; set; }

}
