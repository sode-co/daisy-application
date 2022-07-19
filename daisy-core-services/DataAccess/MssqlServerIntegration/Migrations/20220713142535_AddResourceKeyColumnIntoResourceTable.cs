using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.MssqlServerIntegration.Migrations
{
    public partial class AddResourceKeyColumnIntoResourceTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ResourceKey",
                table: "Resources",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ResourceKey",
                table: "Resources");
        }
    }
}
