using System.ComponentModel.DataAnnotations;

namespace AutoTrack.Database.Models.Tables;

public class tClient
{
    [Key]
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
