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
        configFile = new("DBAutoTrack");

        connectionSettings = new ConnectionSettings
        {
            Server = configFile["Server"].ToString(),
            Database = configFile["Database"].ToString(),
            User_Id = configFile["User_Id"].ToString(),
            Password = configFile["Password"].ToString(),
        };

        string text = connectionSettings.ConnectionFor_SQLServer();
        optionsBuilder.UseSqlServer(text);
    }

    public DbSet<tVehicle> tVehicle { get; set; }
    public DbSet<tClient> tClient { get; set; }
    public DbSet<tVehicleBrand> tVehicleBrand { get; set; }
    public DbSet<tVehicleClient> tVehicleClient { get; set; }



    public DbSet<vwWorkOrder> vwWorkOrder { get; set; }
    public DbSet<vwVehicle> vwVehicle { get; set; }
    public DbSet<vwVehicleClient> vwVehicleClient { get; set; }

}
