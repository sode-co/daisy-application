using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.MssqlServerIntegration.Migrations
{
    public partial class InitDB_v14 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Requests_Requests_RequestId",
                table: "Requests");

            migrationBuilder.RenameColumn(
                name: "RequestId",
                table: "Requests",
                newName: "ParentRequestId");

            migrationBuilder.RenameIndex(
                name: "IX_Requests_RequestId",
                table: "Requests",
                newName: "IX_Requests_ParentRequestId");

            migrationBuilder.AddColumn<int>(
                name: "Status",
                table: "Requests",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddForeignKey(
                name: "FK_Requests_Requests_ParentRequestId",
                table: "Requests",
                column: "ParentRequestId",
                principalTable: "Requests",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Requests_Requests_ParentRequestId",
                table: "Requests");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "Requests");

            migrationBuilder.RenameColumn(
                name: "ParentRequestId",
                table: "Requests",
                newName: "RequestId");

            migrationBuilder.RenameIndex(
                name: "IX_Requests_ParentRequestId",
                table: "Requests",
                newName: "IX_Requests_RequestId");

            migrationBuilder.AddForeignKey(
                name: "FK_Requests_Requests_RequestId",
                table: "Requests",
                column: "RequestId",
                principalTable: "Requests",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
