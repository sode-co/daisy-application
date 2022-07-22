using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.MssqlServerIntegration.Migrations
{
    public partial class AlterTablePaymentAction : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Workspaces",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Users",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Reviews",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Resources",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Requests",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Projects",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Portfolios",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Payments",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "PaymentActions",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            migrationBuilder.AddColumn<string>(
                name: "OrderId",
                table: "PaymentActions",
                type: "nvarchar(max)",
                nullable: true);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Notifications",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "JobApplications",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Discussions",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "Categories",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "RefreshToken",
            //    table: "AuthTokens",
            //    type: "nvarchar(500)",
            //    maxLength: 500,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(500)",
            //    oldMaxLength: 500);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "AuthTokens",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);

            //migrationBuilder.AlterColumn<string>(
            //    name: "ObjectId",
            //    table: "ArtWorks",
            //    type: "nvarchar(255)",
            //    maxLength: 255,
            //    nullable: true,
            //    oldClrType: typeof(string),
            //    oldType: "nvarchar(255)",
            //    oldMaxLength: 255);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "OrderId",
                table: "PaymentActions");

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Workspaces",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Users",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Reviews",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Resources",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Requests",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Projects",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Portfolios",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Payments",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "PaymentActions",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Notifications",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "JobApplications",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Discussions",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "Categories",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "RefreshToken",
            //        table: "AuthTokens",
            //        type: "nvarchar(500)",
            //        maxLength: 500,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(500)",
            //        oldMaxLength: 500,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "AuthTokens",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);

            //    migrationBuilder.AlterColumn<string>(
            //        name: "ObjectId",
            //        table: "ArtWorks",
            //        type: "nvarchar(255)",
            //        maxLength: 255,
            //        nullable: false,
            //        defaultValue: "",
            //        oldClrType: typeof(string),
            //        oldType: "nvarchar(255)",
            //        oldMaxLength: 255,
            //        oldNullable: true);
        }
    }
}
