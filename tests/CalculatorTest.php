<?php

namespace Tests;

use App\Calculator;
use PHPUnit\Framework\TestCase;

final class CalculatorTest extends TestCase
{
    public function testAdd(): void
    {
        $this->assertSame(7, (new Calculator())->add(3, 4));
    }

    public function testMultiply(): void
    {
        $this->assertSame(12, (new Calculator())->multiply(3, 4));
    }
}
