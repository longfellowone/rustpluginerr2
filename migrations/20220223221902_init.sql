create extension if not exists "uuid-ossp";


create table assembly
(
    assembly_id uuid primary key default uuid_generate_v4(),
    assembly    text not null,
    labour      int  not null
);

insert into assembly (assembly_id, assembly, labour)
values ('00000000-0000-0000-0000-000000000001',
        'wood_frame, plastic, a15, plastic, l60, true, null, schneider_home_line',
        60),
       ('00000000-0000-0000-0000-000000000002',
        'wood_frame, plastic, a15, plastic, l80, true, null, schneider_home_line',
        60),
       ('00000000-0000-0000-0000-000000000003',
        'wood_frame, plastic, a15, plastic, l80, false, null, null',
        60);

create table receptacle_assembly
(
    receptacle_assembly_id uuid primary key default uuid_generate_v4(),
    assembly_id            uuid references assembly (assembly_id) not null,
    installation           text                                   not null,
    box_type               text                                   not null,
    amps                   int                                    not null,
    wall_plate             text                                   not null,
    conductor_length       int                                    not null,
    is_home_run            bool                                   not null,
    protection             text,
    panel_type             text
);

insert into receptacle_assembly (receptacle_assembly_id, assembly_id, installation, box_type, amps, wall_plate,
                                 conductor_length,
                                 is_home_run, protection, panel_type)
values ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'wood_frame', 'plastic', 15,
        'plastic', 60, true, null, 'schneider_home_line'),
       ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 'wood_frame', 'plastic', 15,
        'plastic', 80, true, null, 'schneider_home_line'),
       ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000003', 'wood_frame', 'plastic', 15,
        'plastic', 80, false, null, null);