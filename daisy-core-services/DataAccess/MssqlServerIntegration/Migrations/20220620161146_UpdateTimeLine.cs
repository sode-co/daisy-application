using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.MssqlServerIntegration.Migrations
{
    public partial class UpdateTimeLine : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Timeline",
                table: "Projects");

            migrationBuilder.DropColumn(
                name: "TimeLine",
                table: "JobApplications");

            migrationBuilder.RenameColumn(
                name: "TimeLine",
                table: "Requests",
                newName: "Timeline");

            migrationBuilder.RenameColumn(
                name: "TimelineTemp",
                table: "Projects",
                newName: "Timeline");

            migrationBuilder.RenameColumn(
                name: "TimeLineTemp",
                table: "JobApplications",
                newName: "Timeline");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Timeline",
                table: "Requests",
                newName: "TimeLine");

            migrationBuilder.AlterColumn<long>(
                name: "Timeline",
                table: "Projects",
                type: "bigint",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AddColumn<DateTime>(
                name: "TimelineTemp",
                table: "Projects",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AlterColumn<long>(
                name: "Timeline",
                table: "JobApplications",
                type: "bigint",
                nullable: false,
                defaultValue: 0L,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "TimeLineTemp",
                table: "JobApplications",
                type: "datetime2",
                nullable: true);
        }
    }
}
