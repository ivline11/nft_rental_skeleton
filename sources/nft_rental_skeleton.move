
// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module nft_rental::rentables_ext;

use kiosk::kiosk_lock_rule::Rule as LockRule;
use sui::{
    bag,
    balance::{Self, Balance},
    clock::Clock,
    coin::{Self, Coin},
    kiosk::{Kiosk, KioskOwnerCap},
    kiosk_extension,
    package::Publisher,
    sui::SUI,
    transfer_policy::{Self, TransferPolicy, TransferPolicyCap, has_rule}
};

const EExtensionNotInstalled: u64 = 0;
const ENotOwner: u64 = 1;
const ENotEnoughCoins: u64 = 2;
const EInvalidKiosk: u64 = 3;
const ERentingPeriodNotOver: u64 = 4;
const EObjectNotExist: u64 = 5;
const ETotalPriceOverflow: u64 = 6;

const PERMISSIONS: u128 = 11;
const SECONDS_IN_A_DAY: u64 = 86400;
const MAX_BASIS_POINTS: u16 = 10_000;
const MAX_VALUE_U64: u64 = 0xff_ff_ff_ff__ff_ff_ff_ff;

public struct Rentables has drop {}

public struct Rented has store, copy, drop { id: ID }

public struct Listed has store, copy, drop { id: ID }

public struct Promise {
    item: Rented,
    duration: u64,
    start_date: u64,
    price_per_day: u64,
    renter_kiosk: ID,
    borrower_kiosk: ID,
}

public struct Rentable<T: key + store> has store {
    object: T,
    duration: u64,
    start_date: Option<u64>,
    price_per_day: u64,
    kiosk_id: ID,
}

public struct RentalPolicy<phantom T> has key, store {
    id: UID,
    balance: Balance<SUI>,
    amount_bp: u64,
}

public struct ProtectedTP<phantom T> has key, store {
    id: UID,
    transfer_policy: TransferPolicy<T>,
    policy_cap: TransferPolicyCap<T>,
}

public fun install(kiosk: &mut Kiosk, cap: &KioskOwnerCap, ctx: &mut TxContext) {
    //TODO
}

public fun remove(kiosk: &mut Kiosk, cap: &KioskOwnerCap, _ctx: &mut TxContext) {
    //TODO
}

public fun setup_renting<T>(publisher: &Publisher, amount_bp: u64, ctx: &mut TxContext) {
    //TODO
}

public fun list<T: key + store>(
    kiosk: &mut Kiosk,
    cap: &KioskOwnerCap,
    protected_tp: &ProtectedTP<T>,
    item_id: ID,
    duration: u64,
    price_per_day: u64,
    ctx: &mut TxContext,
) {
    //TODO
}

public fun delist<T: key + store>(
    kiosk: &mut Kiosk,
    cap: &KioskOwnerCap,
    transfer_policy: &TransferPolicy<T>,
    item_id: ID,
    _ctx: &mut TxContext,
) {
    //TODO
}

fun take_from_bag<T: key + store, Key: store + copy + drop>(
    kiosk: &mut Kiosk,
    item: Key,
): Rentable<T> {
    //TODO
}

fun place_in_bag<T: key + store, Key: store + copy + drop>(
    kiosk: &mut Kiosk,
    item: Key,
    rentable: Rentable<T>,
) {
    //TODO
}
// === Test Functions ===

#[test_only]
// public fun test_take_from_bag<T: key + store>(kiosk: &mut Kiosk, item_id: ID) {
public fun test_take_from_bag<T: key + store, Key: store + copy + drop>(
    kiosk: &mut Kiosk,
    item: Key,
) {
    let rentable = take_from_bag<T, Key>(kiosk, item);

    let Rentable {
        object,
        duration: _,
        start_date: _,
        price_per_day: _,
        kiosk_id: _,
    } = rentable;

    transfer::public_share_object(object);
}

#[test_only]
public fun create_listed(id: ID): Listed {
    Listed { id }
}