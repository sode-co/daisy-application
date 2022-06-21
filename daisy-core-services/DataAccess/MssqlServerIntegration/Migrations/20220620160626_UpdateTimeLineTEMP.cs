using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.MssqlServerIntegration.Migrations
{
    public partial class UpdateTimeLineTEMP : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "TimeLine",
                table: "Requests",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "TimelineTemp",
                table: "Projects",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "TimeLineTemp",
                table: "JobApplications",
                type: "datetime2",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "TimeLine",
                table: "Requests");

            migrationBuilder.DropColumn(
                name: "TimelineTemp",
                table: "Projects");

            migrationBuilder.DropColumn(
                name: "TimeLineTemp",
                table: "JobApplications");
        }
    }
}
