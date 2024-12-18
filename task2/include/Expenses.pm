package Expenses;

use strict;
use warnings;

sub new
{
	my ($class, $args) = @_;
	my $self = bless { household_needs => $args->{household_needs},
					   bad_habits => $args->{bad_habits},
					   hygiene_and_health => $args->{hygiene_and_health},
					   clothes => $args->{clothes},
					   trips => $args->{trips},
					   food_products => $args->{food_products},
					   entertainments => $args->{entertainments},
					   connection => $args->{connection},
					   total_per_week => $args->{total_per_week},
					   total_per_day => $args->{total_per_day}
					 }, $class;
}

sub print_array
{
	my ($self, $array_ref, $separator) = @_;
	return join($separator, @$array_ref);
}

sub write_to_file
{
	my $self = shift;
	my $notice = "Примечание:\n" . "\tР.нед. - расходы на неделю;\n" . "\tП.р. - план расходов.\n\n";
	my $title = "Расходы бюджета\n";
	my $columns = "Категории расходов" . "\t" . "Р.нед." . "\t" . "П.р." . "\t" . "1" . "\t" . "2". "\t" . "3" . "\t" . "4" . "\t" . "5" . "\t" . "6" . "\t" . "7\n";
	my $household_needs_column = "Бытовые нужды" . "\t\t" . $self->print_array($self->{household_needs}, "\t") . "\n";
	my $bad_habits_column = "Вредные привычки" . "\t" . $self->print_array($self->{bad_habits}, "\t") . "\n";
	my $hygiene_and_health_column = "Гигиена и здоровье" . "\t" . $self->print_array($self->{hygiene_and_health}, "\t") . "\n";
	my $clothes_column = "Одежда" . "\t\t\t" . $self->print_array($self->{clothes}, "\t") . "\n";
	my $trips_column = "Поездки" . "\t\t\t" . $self->print_array($self->{trips}, "\t") . "\n";
	my $food_products_column = "Продукты питания" . "\t" . $self->print_array($self->{food_products}, "\t") . "\n";
	my $entertainments_column = "Развлечения" . "\t\t" . $self->print_array($self->{entertainments}, "\t") . "\n";
	my $connection_column = "Связь" . "\t\t\t" . $self->print_array($self->{connection}, "\t") . "\n";
	my $total_per_week_column = "Итого за неделю" . "\t\t" . $self->print_array($self->{total_per_week}, "\t") . "\n";	
	my $total_per_day_column = "\t\t\t" . "Итого за день" . "\t" . $self->print_array($self->{total_per_day}, "\t") . "\n";
	
	my ($filename) = @_;
	open(FH, '>', $filename) or die $!;
	print FH $notice . $title . $columns . $household_needs_column . $bad_habits_column . $hygiene_and_health_column . $clothes_column . $trips_column . $food_products_column . $entertainments_column . $connection_column . $total_per_week_column . $total_per_day_column;
	close(FH);
}

1;
