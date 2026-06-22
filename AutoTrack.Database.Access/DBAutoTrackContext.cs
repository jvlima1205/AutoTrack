using AutoTrack.Database.Models;
using AutoTrack.Database.Models.Tables;
using AutoTrack.Database.Models.Views;
using Microsoft.EntityFrameworkCore;
using Tools.ParametersV3;
using Tools.ParametersV3.Utilities;

namespace AutoTrack.Database.Access;

public class DBAutoTrackContext : DbContext
{
    private TPar<ConnectionSettings> configFile;
    private ConnectionSettings connectionSettings;

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Data Source=SQL1002.site4now.net;Initial Catalog=db_acad1a_dbautotrack;User Id=db_acad1a_dbautotrack_admin;Password=Ie022psbjv@;Encrypt=True;TrustServerCertificate=True;");
    }

    public DbSet<tVehicle> tVehicle { get; set; }
    public DbSet<tClient> tClient { get; set; }
    public DbSet<tVehicleBrand> tVehicleBrand { get; set; }
    public DbSet<tVehicleClient> tVehicleClient { get; set; }
    public DbSet<tStatus> tStatus { get; set; }
    public DbSet<tWorkOrder> tWorkOrder { get; set; }



    public DbSet<vwWorkOrder> vwWorkOrder { get; set; }
    public DbSet<vwVehicle> vwVehicle { get; set; }
    public DbSet<vwVehicleClient> vwVehicleClient { get; set; }

}
