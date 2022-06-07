using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.MssqlServerIntegration.Migrations
{
    public partial class UpdateModel_DBv11ProjectRequestJobApplication : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ReferenceFile",
                table: "Projects");

            migrationBuilder.RenameColumn(
                name: "Budget",
                table: "JobApplications",
                newName: "OfferedPrice");

            migrationBuilder.AddColumn<decimal>(
                name: "Budget",
                table: "Requests",
                type: "decimal(18,2)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Budget",
                table: "Requests");

            migrationBuilder.RenameColumn(
                name: "OfferedPrice",
                table: "JobApplications",
                newName: "Budget");

            migrationBuilder.AddColumn<string>(
                name: "ReferenceFile",
                table: "Projects",
                type: "nvarchar(255)",
                maxLength: 255,
                nullable: false,
                defaultValue: "");
        }
    }
}
