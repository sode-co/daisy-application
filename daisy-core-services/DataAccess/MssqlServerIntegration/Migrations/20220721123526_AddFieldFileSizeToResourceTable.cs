using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.MssqlServerIntegration.Migrations
{
    public partial class AddFieldFileSizeToResourceTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<long>(
                name: "FileSize",
                table: "Resources",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);

            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "PaymentActions",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "FileSize",
                table: "Resources");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "PaymentActions");
        }
    }
}
