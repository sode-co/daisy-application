using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.MssqlServerIntegration.Migrations
{
    public partial class InitDB_v11 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ArtWorkResourceMaps");

            migrationBuilder.DropTable(
                name: "ProjectResourceMaps");

            migrationBuilder.AddColumn<int>(
                name: "ArtWorkId",
                table: "Resources",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ProjectId",
                table: "Resources",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Resources_ArtWorkId",
                table: "Resources",
                column: "ArtWorkId");

            migrationBuilder.CreateIndex(
                name: "IX_Resources_ProjectId",
                table: "Resources",
                column: "ProjectId");

            migrationBuilder.AddForeignKey(
                name: "FK_Resources_ArtWorks_ArtWorkId",
                table: "Resources",
                column: "ArtWorkId",
                principalTable: "ArtWorks",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Resources_Projects_ProjectId",
                table: "Resources",
                column: "ProjectId",
                principalTable: "Projects",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Resources_ArtWorks_ArtWorkId",
                table: "Resources");

            migrationBuilder.DropForeignKey(
                name: "FK_Resources_Projects_ProjectId",
                table: "Resources");

            migrationBuilder.DropIndex(
                name: "IX_Resources_ArtWorkId",
                table: "Resources");

            migrationBuilder.DropIndex(
                name: "IX_Resources_ProjectId",
                table: "Resources");

            migrationBuilder.DropColumn(
                name: "ArtWorkId",
                table: "Resources");

            migrationBuilder.DropColumn(
                name: "ProjectId",
                table: "Resources");

            migrationBuilder.CreateTable(
                name: "ArtWorkResourceMaps",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ArtWorkId = table.Column<int>(type: "int", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DeletedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ObjectId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ResourceId = table.Column<int>(type: "int", nullable: true),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ArtWorkResourceMaps", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ArtWorkResourceMaps_ArtWorks_ArtWorkId",
                        column: x => x.ArtWorkId,
                        principalTable: "ArtWorks",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ArtWorkResourceMaps_Resources_ResourceId",
                        column: x => x.ResourceId,
                        principalTable: "Resources",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ProjectResourceMaps",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DeletedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ObjectId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ProjectId = table.Column<int>(type: "int", nullable: true),
                    ResourceId = table.Column<int>(type: "int", nullable: true),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProjectResourceMaps", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ProjectResourceMaps_Projects_ProjectId",
                        column: x => x.ProjectId,
                        principalTable: "Projects",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ProjectResourceMaps_Resources_ResourceId",
                        column: x => x.ResourceId,
                        principalTable: "Resources",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ArtWorkResourceMaps_ArtWorkId",
                table: "ArtWorkResourceMaps",
                column: "ArtWorkId");

            migrationBuilder.CreateIndex(
                name: "IX_ArtWorkResourceMaps_ResourceId",
                table: "ArtWorkResourceMaps",
                column: "ResourceId");

            migrationBuilder.CreateIndex(
                name: "IX_ProjectResourceMaps_ProjectId",
                table: "ProjectResourceMaps",
                column: "ProjectId");

            migrationBuilder.CreateIndex(
                name: "IX_ProjectResourceMaps_ResourceId",
                table: "ProjectResourceMaps",
                column: "ResourceId");
        }
    }
}
